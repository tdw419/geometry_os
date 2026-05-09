; DESCRIPTION: Renders a cyan box of size 57x29 starting at (176, 218).
; PLAN: r0=176(x), r1=218(y), r2=57(width), r3=29(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 218
LDI r2, 57
LDI r3, 29
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
