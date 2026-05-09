; DESCRIPTION: Draws a cyan rectangle at (242, 42) with width 30 and height 117.
; PLAN: r0=242(x), r1=42(y), r2=30(width), r3=117(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 42
LDI r2, 30
LDI r3, 117
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
