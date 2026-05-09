; DESCRIPTION: Renders a cyan box of size 27x56 starting at (120, 139).
; PLAN: r0=120(x), r1=139(y), r2=27(width), r3=56(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 139
LDI r2, 27
LDI r3, 56
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
