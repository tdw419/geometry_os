; DESCRIPTION: Renders a cyan box of size 48x32 starting at (328, 32).
; PLAN: r0=328(x), r1=32(y), r2=48(width), r3=32(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 32
LDI r2, 48
LDI r3, 32
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
