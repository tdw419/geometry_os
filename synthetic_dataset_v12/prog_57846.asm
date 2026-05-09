; DESCRIPTION: Renders a orange box of size 111x41 starting at (360, 177).
; PLAN: r0=360(x), r1=177(y), r2=111(width), r3=41(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 360
LDI r1, 177
LDI r2, 111
LDI r3, 41
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
