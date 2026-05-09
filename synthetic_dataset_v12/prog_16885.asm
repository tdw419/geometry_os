; DESCRIPTION: Draws a cyan line from (242, 149) to (28, 209).
; PLAN: r0=242(x1), r1=149(y1), r2=28(x2), r3=209(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 149
LDI r2, 28
LDI r3, 209
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
