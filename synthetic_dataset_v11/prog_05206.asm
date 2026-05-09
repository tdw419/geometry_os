; DESCRIPTION: Composite: . Then Renders a black line between points (105, 93) and (206, 33). Then Renders a orange box of size 94x41 starting at (27, 47).
; PLAN: r0=105(x1), r1=93(y1), r2=206(x2), r3=33(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=27(x), r1=47(y), r2=94(width), r3=41(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a black line between points (105, 93) and (206, 33).
; PLAN: r0=105(x1), r1=93(y1), r2=206(x2), r3=33(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 93
LDI r2, 206
LDI r3, 33
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Renders a orange box of size 94x41 starting at (27, 47).
; PLAN: r0=27(x), r1=47(y), r2=94(width), r3=41(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 47
LDI r2, 94
LDI r3, 41
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
