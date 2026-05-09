; DESCRIPTION: Draws a cyan rectangle at (221, 193) with width 28 and height 42.
; PLAN: r0=221(x), r1=193(y), r2=28(width), r3=42(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 193
LDI r2, 28
LDI r3, 42
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
