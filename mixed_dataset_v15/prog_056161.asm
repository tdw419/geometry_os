; DESCRIPTION: Renders a orange box of size 70x109 starting at (284, 120).
; PLAN: r0=284(x), r1=120(y), r2=70(width), r3=109(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 120
LDI r2, 70
LDI r3, 109
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
