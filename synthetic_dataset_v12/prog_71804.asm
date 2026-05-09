; DESCRIPTION: Renders a orange box of size 50x57 starting at (220, 82).
; PLAN: r0=220(x), r1=82(y), r2=50(width), r3=57(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 82
LDI r2, 50
LDI r3, 57
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
