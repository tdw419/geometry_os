; DESCRIPTION: Creates a cyan rectangular region at (228, 20) spanning 63 by 69 pixels.
; PLAN: r0=228(x), r1=20(y), r2=63(width), r3=69(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 20
LDI r2, 63
LDI r3, 69
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
