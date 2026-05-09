; DESCRIPTION: Draws a cyan rectangle at (228, 59) with width 16 and height 99.
; PLAN: r0=228(x), r1=59(y), r2=16(width), r3=99(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 59
LDI r2, 16
LDI r3, 99
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
