; DESCRIPTION: Draws a black line from (410, 171) to (375, 213).
; PLAN: r0=410(x1), r1=171(y1), r2=375(x2), r3=213(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 410
LDI r1, 171
LDI r2, 375
LDI r3, 213
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
