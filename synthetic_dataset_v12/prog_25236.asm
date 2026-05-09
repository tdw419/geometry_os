; DESCRIPTION: Renders a cyan box of size 86x111 starting at (75, 131).
; PLAN: r0=75(x), r1=131(y), r2=86(width), r3=111(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 131
LDI r2, 86
LDI r3, 111
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
