; DESCRIPTION: Draws a cyan rectangle at (333, 168) with width 35 and height 32.
; PLAN: r0=333(x), r1=168(y), r2=35(width), r3=32(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 333
LDI r1, 168
LDI r2, 35
LDI r3, 32
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
