; DESCRIPTION: Renders a orange box of size 120x33 starting at (263, 55).
; PLAN: r0=263(x), r1=55(y), r2=120(width), r3=33(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 263
LDI r1, 55
LDI r2, 120
LDI r3, 33
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
