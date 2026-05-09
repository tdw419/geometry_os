; DESCRIPTION: Composite: . Then Draws a black line from (112, 253) to (107, 132). Then Renders a orange box of size 98x107 starting at (142, 79).
; PLAN: r0=112(x1), r1=253(y1), r2=107(x2), r3=132(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=142(x), r1=79(y), r2=98(width), r3=107(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a black line from (112, 253) to (107, 132).
; PLAN: r0=112(x1), r1=253(y1), r2=107(x2), r3=132(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 253
LDI r2, 107
LDI r3, 132
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Renders a orange box of size 98x107 starting at (142, 79).
; PLAN: r0=142(x), r1=79(y), r2=98(width), r3=107(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 79
LDI r2, 98
LDI r3, 107
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
