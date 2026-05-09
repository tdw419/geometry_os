; DESCRIPTION: Renders a cyan box of size 55x82 starting at (12, 60).
; PLAN: r0=12(x), r1=60(y), r2=55(width), r3=82(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 60
LDI r2, 55
LDI r3, 82
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
