; DESCRIPTION: Places a white line segment connecting (180, 195) to (124, 213).
; PLAN: r0=180(x1), r1=195(y1), r2=124(x2), r3=213(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 195
LDI r2, 124
LDI r3, 213
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
