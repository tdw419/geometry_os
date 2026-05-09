; DESCRIPTION: Draws a cyan line from (421, 135) to (171, 128).
; PLAN: r0=421(x1), r1=135(y1), r2=171(x2), r3=128(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 421
LDI r1, 135
LDI r2, 171
LDI r3, 128
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
