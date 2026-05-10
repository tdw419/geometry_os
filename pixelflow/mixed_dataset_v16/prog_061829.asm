; DESCRIPTION: Renders a orange box of size 92x105 starting at (392, 83).
; PLAN: r0=392(x), r1=83(y), r2=92(width), r3=105(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 392
LDI r1, 83
LDI r2, 92
LDI r3, 105
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
