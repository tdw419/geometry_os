; DESCRIPTION: Renders a cyan box of size 51x86 starting at (440, 0).
; PLAN: r0=440(x), r1=0(y), r2=51(width), r3=86(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 440
LDI r1, 0
LDI r2, 51
LDI r3, 86
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
