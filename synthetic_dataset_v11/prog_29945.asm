; DESCRIPTION: Renders a orange box of size 50x35 starting at (173, 177).
; PLAN: r0=173(x), r1=177(y), r2=50(width), r3=35(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 177
LDI r2, 50
LDI r3, 35
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
