; DESCRIPTION: Draws a cyan line from (239, 191) to (131, 243).
; PLAN: r0=239(x1), r1=191(y1), r2=131(x2), r3=243(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 191
LDI r2, 131
LDI r3, 243
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
