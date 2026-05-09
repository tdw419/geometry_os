; DESCRIPTION: Renders a cyan box of size 16x49 starting at (420, 86).
; PLAN: r0=420(x), r1=86(y), r2=16(width), r3=49(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 420
LDI r1, 86
LDI r2, 16
LDI r3, 49
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
