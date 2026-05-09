; DESCRIPTION: Places a cyan line segment connecting (167, 126) to (217, 182).
; PLAN: r0=167(x1), r1=126(y1), r2=217(x2), r3=182(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 126
LDI r2, 217
LDI r3, 182
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
