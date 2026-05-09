; DESCRIPTION: Renders a orange box of size 104x52 starting at (103, 126).
; PLAN: r0=103(x), r1=126(y), r2=104(width), r3=52(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 126
LDI r2, 104
LDI r3, 52
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
