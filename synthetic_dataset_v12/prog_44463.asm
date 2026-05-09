; DESCRIPTION: Renders a orange box of size 94x12 starting at (392, 30).
; PLAN: r0=392(x), r1=30(y), r2=94(width), r3=12(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 392
LDI r1, 30
LDI r2, 94
LDI r3, 12
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
