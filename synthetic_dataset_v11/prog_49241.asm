; DESCRIPTION: Creates a red rectangular region at (70, 150) spanning 68 by 40 pixels.
; PLAN: r0=70(x), r1=150(y), r2=68(width), r3=40(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 150
LDI r2, 68
LDI r3, 40
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
