; DESCRIPTION: Composite: . Then Renders a cyan disk with center (213, 80) and radius 42. Then Renders a red box of size 41x100 starting at (201, 51).
; PLAN: r0=213(x), r1=80(y), r2=42(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=201(x), r1=51(y), r2=41(width), r3=100(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a cyan disk with center (213, 80) and radius 42.
; PLAN: r0=213(x), r1=80(y), r2=42(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 213
LDI r1, 80
LDI r2, 42
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Renders a red box of size 41x100 starting at (201, 51).
; PLAN: r0=201(x), r1=51(y), r2=41(width), r3=100(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 51
LDI r2, 41
LDI r3, 100
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
