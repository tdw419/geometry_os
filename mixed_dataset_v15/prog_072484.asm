; DESCRIPTION: Draws a white line from (154, 135) to (452, 213).
; PLAN: r0=154(x1), r1=135(y1), r2=452(x2), r3=213(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 135
LDI r2, 452
LDI r3, 213
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
