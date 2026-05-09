; DESCRIPTION: Places a cyan 48x20 rectangle at position (190, 166).
; PLAN: r0=190(x), r1=166(y), r2=48(width), r3=20(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 166
LDI r2, 48
LDI r3, 20
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
