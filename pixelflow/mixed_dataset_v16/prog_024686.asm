; DESCRIPTION: Draws a cyan rectangle at (308, 190) with width 113 and height 42.
; PLAN: r0=308(x), r1=190(y), r2=113(width), r3=42(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 308
LDI r1, 190
LDI r2, 113
LDI r3, 42
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
