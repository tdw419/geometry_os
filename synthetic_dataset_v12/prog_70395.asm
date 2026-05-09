; DESCRIPTION: Renders a cyan box of size 24x64 starting at (208, 1).
; PLAN: r0=208(x), r1=1(y), r2=24(width), r3=64(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 1
LDI r2, 24
LDI r3, 64
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
