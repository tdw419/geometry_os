; DESCRIPTION: Draws a cyan line from (487, 191) to (189, 198).
; PLAN: r0=487(x1), r1=191(y1), r2=189(x2), r3=198(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 487
LDI r1, 191
LDI r2, 189
LDI r3, 198
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
