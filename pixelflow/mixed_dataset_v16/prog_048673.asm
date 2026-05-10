; DESCRIPTION: Renders a orange box of size 107x38 starting at (146, 118).
; PLAN: r0=146(x), r1=118(y), r2=107(width), r3=38(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 118
LDI r2, 107
LDI r3, 38
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
