; DESCRIPTION: Renders a cyan box of size 79x27 starting at (254, 204).
; PLAN: r0=254(x), r1=204(y), r2=79(width), r3=27(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 204
LDI r2, 79
LDI r3, 27
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
