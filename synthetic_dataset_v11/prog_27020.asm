; DESCRIPTION: Draws a cyan rectangle at (50, 109) with width 57 and height 42.
; PLAN: r0=50(x), r1=109(y), r2=57(width), r3=42(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 109
LDI r2, 57
LDI r3, 42
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
