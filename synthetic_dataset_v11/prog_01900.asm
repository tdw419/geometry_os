; DESCRIPTION: Renders a cyan box of size 104x42 starting at (47, 109).
; PLAN: r0=47(x), r1=109(y), r2=104(width), r3=42(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 109
LDI r2, 104
LDI r3, 42
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
