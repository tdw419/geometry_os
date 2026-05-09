; DESCRIPTION: Renders a cyan box of size 103x39 starting at (35, 60).
; PLAN: r0=35(x), r1=60(y), r2=103(width), r3=39(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 60
LDI r2, 103
LDI r3, 39
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
