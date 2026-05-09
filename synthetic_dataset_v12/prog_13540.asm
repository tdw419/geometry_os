; DESCRIPTION: Renders a cyan box of size 64x16 starting at (315, 225).
; PLAN: r0=315(x), r1=225(y), r2=64(width), r3=16(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 315
LDI r1, 225
LDI r2, 64
LDI r3, 16
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
