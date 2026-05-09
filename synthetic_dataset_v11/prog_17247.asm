; DESCRIPTION: Draws a red line from (23, 210) to (239, 48).
; PLAN: r0=23(x1), r1=210(y1), r2=239(x2), r3=48(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 210
LDI r2, 239
LDI r3, 48
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
