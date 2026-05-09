; DESCRIPTION: Renders a cyan box of size 28x28 starting at (354, 117).
; PLAN: r0=354(x), r1=117(y), r2=28(width), r3=28(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 117
LDI r2, 28
LDI r3, 28
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
