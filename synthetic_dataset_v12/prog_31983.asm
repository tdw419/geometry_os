; DESCRIPTION: Renders a orange box of size 30x37 starting at (350, 171).
; PLAN: r0=350(x), r1=171(y), r2=30(width), r3=37(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 350
LDI r1, 171
LDI r2, 30
LDI r3, 37
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
