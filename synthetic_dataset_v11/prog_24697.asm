; DESCRIPTION: Renders a orange box of size 68x94 starting at (140, 146).
; PLAN: r0=140(x), r1=146(y), r2=68(width), r3=94(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 146
LDI r2, 68
LDI r3, 94
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
