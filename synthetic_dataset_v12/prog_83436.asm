; DESCRIPTION: Renders a cyan box of size 74x27 starting at (16, 142).
; PLAN: r0=16(x), r1=142(y), r2=74(width), r3=27(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 142
LDI r2, 74
LDI r3, 27
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
