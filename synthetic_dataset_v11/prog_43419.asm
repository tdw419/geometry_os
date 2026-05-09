; DESCRIPTION: Draws a cyan rectangle at (7, 173) with width 42 and height 82.
; PLAN: r0=7(x), r1=173(y), r2=42(width), r3=82(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 173
LDI r2, 42
LDI r3, 82
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
