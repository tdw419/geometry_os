; DESCRIPTION: Renders a orange box of size 89x25 starting at (372, 104).
; PLAN: r0=372(x), r1=104(y), r2=89(width), r3=25(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 372
LDI r1, 104
LDI r2, 89
LDI r3, 25
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
