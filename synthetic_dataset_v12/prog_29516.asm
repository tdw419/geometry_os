; DESCRIPTION: Renders a orange box of size 120x14 starting at (351, 146).
; PLAN: r0=351(x), r1=146(y), r2=120(width), r3=14(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 351
LDI r1, 146
LDI r2, 120
LDI r3, 14
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
