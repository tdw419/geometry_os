; DESCRIPTION: Renders a cyan box of size 104x104 starting at (354, 32).
; PLAN: r0=354(x), r1=32(y), r2=104(width), r3=104(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 32
LDI r2, 104
LDI r3, 104
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
