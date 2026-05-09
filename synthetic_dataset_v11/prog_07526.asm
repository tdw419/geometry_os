; DESCRIPTION: Renders a cyan box of size 76x21 starting at (154, 200).
; PLAN: r0=154(x), r1=200(y), r2=76(width), r3=21(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 200
LDI r2, 76
LDI r3, 21
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
