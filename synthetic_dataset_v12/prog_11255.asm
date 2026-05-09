; DESCRIPTION: Creates a magenta rectangular region at (365, 159) spanning 75 by 50 pixels.
; PLAN: r0=365(x), r1=159(y), r2=75(width), r3=50(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 365
LDI r1, 159
LDI r2, 75
LDI r3, 50
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
