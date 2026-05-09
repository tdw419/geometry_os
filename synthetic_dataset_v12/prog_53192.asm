; DESCRIPTION: Draws a orange rectangle at (404, 150) with width 74 and height 42.
; PLAN: r0=404(x), r1=150(y), r2=74(width), r3=42(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 404
LDI r1, 150
LDI r2, 74
LDI r3, 42
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
