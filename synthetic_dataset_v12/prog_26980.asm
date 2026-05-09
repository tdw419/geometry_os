; DESCRIPTION: Renders a cyan box of size 86x120 starting at (383, 125).
; PLAN: r0=383(x), r1=125(y), r2=86(width), r3=120(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 383
LDI r1, 125
LDI r2, 86
LDI r3, 120
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
