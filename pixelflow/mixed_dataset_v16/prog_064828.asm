; DESCRIPTION: Renders a orange box of size 75x47 starting at (218, 50).
; PLAN: r0=218(x), r1=50(y), r2=75(width), r3=47(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 50
LDI r2, 75
LDI r3, 47
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
