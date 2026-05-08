; DESCRIPTION: Fills the screen with a vertical gradient from black to white.*

word_0:
LDI r12, 0x4000
LDI r1, 0
ADD r1, r11
LOAD r15, r1
write_digits

LDI r2, 0x40D0D1
LOAD r15, r2
LDI r7, 1
ADD r15, r7
STORE r1, r15
LDI r2, 1
ADD r11, r2
ADD r10, r2
JMP write_digits

write_digits:
LDI r1, 0x2404
STORE r1, r15
LDI r2, 1
ADD r10, r2
JMP write_digits

write_digits:
LDI r1, 0x2403
LOAD r15, r1
LDI r2, 1
ADD r15, r2
STORE r1, r15
LDI r2, 4
LDI r7, wd_ok:
POP r31
RET

do_date:
PUSH r31
PUSH r11
PUSH r2
PUSH r12
PUSH r3