; DESCRIPTION: Creates a white rectangular region at (295, 228) spanning 36 by 13 pixels.
; PLAN: r0=295(x), r1=228(y), r2=36(width), r3=13(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 295
LDI r1, 228
LDI r2, 36
LDI r3, 13
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
